# test_unit.py
import unittest
from math_operations import add, subtract, multiply

class TestMathOperations(unittest.TestCase):
    def test_add(self):
        self.assertEqual(add(3, 5), 8)

    def test_subtract(self):
        self.assertEqual(subtract(8, 3), 5)

    def test_multiply(self):
        self.assertEqual(multiply(2, 4), 8)

if __name__ == '__main__':
    unittest.main()
