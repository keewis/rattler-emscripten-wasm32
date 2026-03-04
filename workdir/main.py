import sys

print("starting to run script")
print(sys.version, flush=True)

try:
    import pyemscripten
    pyemscripten.sum_as_string(2, 3)
except Exception as e:
    print(e)
