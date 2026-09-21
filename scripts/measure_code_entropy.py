#!/usr/bin/env python3
import os
import math
from collections import Counter

def calc_byte_entropy(data: bytes) -> float:
    if not data:
        return 0.0
    counter = Counter(data)
    total = len(data)
    entropy = 0.0
    for count in counter.values():
        p = count / total
        entropy -= p * math.log2(p)
    return entropy

def calc_token_entropy(text: str) -> float:
    import re
    tokens = re.findall(r'\w+|[^\w\s]', text)
    if not tokens:
        return 0.0
    counter = Counter(tokens)
    total = len(tokens)
    entropy = 0.0
    for count in counter.values():
        p = count / total
        entropy -= p * math.log2(p)
    return entropy

def calc_hehner_bit_depth(s: int) -> int:
    if s <= 0:
        return 0
    return math.ceil(math.log2(s))

def scan_dir(directory, ext):
    file_stats = []
    total_bytes = 0
    total_tokens = 0
    byte_counts = Counter()
    token_counts = Counter()

    for root, _, files in os.walk(directory):
        for f in files:
            if f.endswith(ext):
                path = os.path.join(root, f)
                with open(path, 'rb') as fp:
                    raw_data = fp.read()
                try:
                    text_data = raw_data.decode('utf-8', errors='ignore')
                except Exception:
                    text_data = ""

                import re
                toks = re.findall(r'\w+|[^\w\s]', text_data)
                
                b_size = len(raw_data)
                t_size = len(toks)
                total_bytes += b_size
                total_tokens += t_size

                byte_counts.update(raw_data)
                token_counts.update(toks)

                file_stats.append({
                    'path': path,
                    'bytes': b_size,
                    'tokens': t_size,
                    'byte_entropy': calc_byte_entropy(raw_data),
                    'token_entropy': calc_token_entropy(text_data),
                    'hehner_b_bytes': calc_hehner_bit_depth(b_size),
                    'hehner_b_tokens': calc_hehner_bit_depth(t_size)
                })

    overall_b_ent = 0.0
    for b, c in byte_counts.items():
        p = c / total_bytes if total_bytes > 0 else 0
        if p > 0:
            overall_b_ent -= p * math.log2(p)

    overall_t_ent = 0.0
    for t, c in token_counts.items():
        p = c / total_tokens if total_tokens > 0 else 0
        if p > 0:
            overall_t_ent -= p * math.log2(p)

    return {
        'count': len(file_stats),
        'total_bytes': total_bytes,
        'total_tokens': total_tokens,
        'overall_byte_entropy': overall_b_ent,
        'overall_token_entropy': overall_t_ent,
        'hehner_b_bytes': calc_hehner_bit_depth(total_bytes),
        'hehner_b_tokens': calc_hehner_bit_depth(total_tokens),
        'files': file_stats
    }

if __name__ == '__main__':
    p1 = '/var/home/justin/Projects/FinSc-Universe2/src'
    p2 = '/var/home/justin/Projects/FinSc-Universe2-Wiki/Library/Wiki'

    res1 = scan_dir(p1, '.idr')
    res2 = scan_dir(p2, ('.idr', '.md'))

    print("=== FinSc-Universe2 (Core Codebase Benchmark) ===")
    print(f"Files: {res1['count']} | Bytes: {res1['total_bytes']:,} | Tokens: {res1['total_tokens']:,}")
    print(f"Shannon Byte Entropy (H_byte): {res1['overall_byte_entropy']:.4f} bits/byte")
    print(f"Shannon Token Entropy (H_token): {res1['overall_token_entropy']:.4f} bits/token")
    print(f"Hehner Byte Bit Depth (b_byte): {res1['hehner_b_bytes']} bits | Chance: 1 / {res1['total_bytes']:,}")

    print("\n=== FinSc-Universe2-Wiki (Literate Wiki Benchmark) ===")
    print(f"Files: {res2['count']} | Bytes: {res2['total_bytes']:,} | Tokens: {res2['total_tokens']:,}")
    print(f"Shannon Byte Entropy (H_byte): {res2['overall_byte_entropy']:.4f} bits/byte")
    print(f"Shannon Token Entropy (H_token): {res2['overall_token_entropy']:.4f} bits/token")
    print(f"Hehner Byte Bit Depth (b_byte): {res2['hehner_b_bytes']} bits | Chance: 1 / {res2['total_bytes']:,}")

    tot_bytes = res1['total_bytes'] + res2['total_bytes']
    tot_tokens = res1['total_tokens'] + res2['total_tokens']
    tot_files = res1['count'] + res2['count']

    print("\n=== Combined System Totals ===")
    print(f"Total Files: {tot_files} | System Bytes: {tot_bytes:,} | System Tokens: {tot_tokens:,}")
    print(f"System Hehner Address Depth: {calc_hehner_bit_depth(tot_bytes)} bits")
    print(f"System Hehner Chance Fraction: 1 / {tot_bytes:,}")

    # Lint check
    h1 = res1['overall_byte_entropy']
    if 3.8 <= h1 <= 7.2:
        print(f"\n[PASS] Core Byte Entropy {h1:.4f} b/B is within optimal bounds [3.8, 7.2].")
    else:
        print(f"\n[FAIL] Core Byte Entropy {h1:.4f} b/B violates optimal bounds [3.8, 7.2].")
