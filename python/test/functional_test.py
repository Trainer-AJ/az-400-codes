# test_functional.py
import unittest
from math_operations import add, subtract, multiply

class TestMathFunctional(unittest.TestCase):
    def test_add_subtract_multiply(self):
        result = add(5, 3)
        result = subtract(result, 2)
        self.assertEqual(multiply(result, 4), 24)

if __name__ == '__main__':
    unittest.main()
