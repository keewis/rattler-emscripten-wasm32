import pytest
import pyemscripten


def test_sum_as_string():
    assert pyemscripten.sum_as_string(1, 1) == "2"
