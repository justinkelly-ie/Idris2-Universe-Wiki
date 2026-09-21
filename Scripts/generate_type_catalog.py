#!/usr/bin/env python3
"""
generate_type_catalog.py

Dynamic generator for the Type Signatures and API Catalog of FinSc-Universe2.
Scans all .idr source files in FinSc-Universe2/src, extracts records, data types,
type aliases, and exported functions/macros, and outputs a formatted Markdown
wiki page in FinSc-Universe2-Wiki/Library/Wiki/Verification/Type_Signatures_and_API_Catalog.md.
"""

import os
import re
import sys
from pathlib import Path
from collections import defaultdict

def parse_idris_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    lines = content.splitlines()
    module_name = ""
    module_doc = []
    
    items = [] # list of (item_type, name, signature/definition, docstring)
    
    current_doc = []
    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        
        # Capture module declaration
        if stripped.startswith("module "):
            module_name = stripped.split()[1]
            i += 1
            continue
            
        # Capture docstrings
        if stripped.startswith("|||"):
            doc_text = stripped[3:].strip()
            current_doc.append(doc_text)
            i += 1
            continue
            
        # Capture records
        if re.match(r'^(public\s+export\s+|export\s+)?record\s+', stripped):
            rec_lines = [line]
            rec_doc = "\n".join(current_doc)
            current_doc = []
            rec_name_match = re.search(r'record\s+([A-Za-z0-9_]+)', stripped)
            rec_name = rec_name_match.group(1) if rec_name_match else "Record"
            
            i += 1
            # collect indented body of record
            while i < len(lines):
                if lines[i].startswith(" ") or lines[i].startswith("\t") or lines[i].strip() == "":
                    rec_lines.append(lines[i])
                    i += 1
                elif lines[i].strip().startswith("|||"):
                    # docstring inside record
                    rec_lines.append(lines[i])
                    i += 1
                else:
                    break
            items.append(('record', rec_name, "\n".join(rec_lines), rec_doc))
            continue
            
        # Capture data types
        if re.match(r'^(public\s+export\s+|export\s+)?data\s+', stripped):
            data_lines = [line]
            data_doc = "\n".join(current_doc)
            current_doc = []
            data_name_match = re.search(r'data\s+([A-Za-z0-9_]+)', stripped)
            data_name = data_name_match.group(1) if data_name_match else "Data"
            
            i += 1
            while i < len(lines):
                if lines[i].startswith(" ") or lines[i].startswith("\t") or lines[i].strip() == "":
                    data_lines.append(lines[i])
                    i += 1
                elif lines[i].strip().startswith("|||"):
                    data_lines.append(lines[i])
                    i += 1
                else:
                    break
            items.append(('data', data_name, "\n".join(data_lines), data_doc))
            continue

        # Capture exported type aliases and function signatures
        if re.match(r'^(public\s+export\s+|export\s+|%macro\s+export\s+|export\s+%macro\s+|public\s+export\s+%macro\s+)([a-zA-Z0-9_]+)\s*:\s*', stripped):
            fn_doc = "\n".join(current_doc)
            current_doc = []
            sig_lines = [line]
            fn_name_match = re.search(r'([a-zA-Z0-9_]+)\s*:\s*', stripped)
            fn_name = fn_name_match.group(1) if fn_name_match else "Function"
            
            i += 1
            # collect multi-line signature until '=' or next definition
            while i < len(lines):
                next_line = lines[i]
                if next_line.startswith(" ") and ("->" in next_line or ":" in next_line or "(" in next_line):
                    sig_lines.append(next_line)
                    i += 1
                else:
                    break
            items.append(('function', fn_name, "\n".join(sig_lines), fn_doc))
            continue

        # Reset docstring if empty or non-matching line encountered
        if stripped == "" or stripped.startswith("--"):
            pass
        else:
            current_doc = []
            
        i += 1

    return module_name, items

def categorize_module(module_name):
    if module_name.startswith("Core."):
        return "1. Core Foundations & Data Structures"
    elif module_name.startswith("Geometry.") or module_name.startswith("Math.LinAlgebra") or module_name.startswith("Derivation.") or "FourGeometries" in module_name:
        return "2. Spacetime, Geometries & Metrics"
    elif module_name.startswith("Evolution."):
        return "3. Cosmological State & Linear Evolution"
    elif module_name.startswith("Math."):
        return "4. Emergent Physical Laws & Gauge Theories"
    elif module_name.startswith("Compound."):
        return "5. Compound Structures & Chemical Networks"
    elif module_name.startswith("Reflect."):
        return "6. Elaborator Reflection & Invariant Macros"
    else:
        return "7. Miscellaneous Modules"

def generate_catalog(src_dir, output_file):
    categorized = defaultdict(lambda: defaultdict(list))
    
    idr_files = sorted(Path(src_dir).rglob("*.idr"))
    
    for filepath in idr_files:
        module_name, items = parse_idris_file(filepath)
        if not module_name:
            continue
        category = categorize_module(module_name)
        categorized[category][module_name] = items

    # Build Markdown Document
    md = []
    md.append("# 📋 Type Signatures & API Catalog")
    md.append("")
    md.append("This document provides an **automatically generated, authoritative reference** for all data types, records, type aliases, and primary state transitions in `FinSc-Universe2`.")
    md.append("")
    md.append("> [!NOTE]")
    md.append("> This catalog is generated dynamically from the codebase source files via `Scripts/generate_type_catalog.py`.")
    md.append("")
    md.append("---")
    md.append("")
    md.append("## <a id=\"table-of-contents\"></a>📑 Table of Contents")
    md.append("")
    
    for cat_idx, cat_name in enumerate(sorted(categorized.keys()), 1):
        cat_anchor = f"section-{cat_idx}"
        md.append(f"- [**{cat_name}**](#{cat_anchor})")
        for mod_name in sorted(categorized[cat_name].keys()):
            mod_anchor = "mod-" + mod_name.lower().replace(".", "-")
            md.append(f"  - [`{mod_name}`](#{mod_anchor})")
            
    md.append("")
    md.append("---")
    md.append("")

    for cat_idx, cat_name in enumerate(sorted(categorized.keys()), 1):
        cat_anchor = f"section-{cat_idx}"
        md.append(f"## <a id=\"{cat_anchor}\"></a>{cat_name}")
        md.append("")
        
        for mod_name in sorted(categorized[cat_name].keys()):
            mod_anchor = "mod-" + mod_name.lower().replace(".", "-")
            items = categorized[cat_name][mod_name]
            md.append(f"### <a id=\"{mod_anchor}\"></a>Module `{mod_name}`")
            md.append("")
            
            records = [item for item in items if item[0] == 'record']
            data_types = [item for item in items if item[0] == 'data']
            functions = [item for item in items if item[0] == 'function']
            
            if records:
                md.append("#### 📦 Records")
                md.append("")
                for _, rec_name, code, doc in records:
                    if doc:
                        md.append(f"*{doc.strip()}*")
                        md.append("")
                    md.append("```idris")
                    md.append(code.strip())
                    md.append("```")
                    md.append("")
                    
            if data_types:
                md.append("#### 🏷️ Algebraic Data Types")
                md.append("")
                for _, data_name, code, doc in data_types:
                    if doc:
                        md.append(f"*{doc.strip()}*")
                        md.append("")
                    md.append("```idris")
                    md.append(code.strip())
                    md.append("```")
                    md.append("")
                    
            if functions:
                md.append("#### ⚙️ Primary Signatures & State Transitions")
                md.append("")
                for _, fn_name, code, doc in functions:
                    if doc:
                        md.append(f"- **`{fn_name}`**: {doc.strip()}")
                    else:
                        md.append(f"- **`{fn_name}`**")
                    md.append("```idris")
                    md.append(code.strip())
                    md.append("```")
                    md.append("")
                    
            md.append("[↑ Back to Top](#table-of-contents)")
            md.append("")
            md.append("---")
            md.append("")

    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write("\n".join(md))

    print(f"✅ Type catalog successfully generated at: {output_path}")

if __name__ == "__main__":
    script_dir = Path(__file__).resolve().parent
    base_proj = script_dir.parent.parent
    src_dir = base_proj / "FinSc-Universe2" / "src"
    output_file = base_proj / "FinSc-Universe2-Wiki" / "Library" / "Wiki" / "Verification" / "Type_Signatures_and_API_Catalog.md"
    
    if len(sys.argv) > 1:
        src_dir = Path(sys.argv[1])
    if len(sys.argv) > 2:
        output_file = Path(sys.argv[2])
        
    generate_catalog(src_dir, output_file)
