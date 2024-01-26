# test_integration.py

# Check if diffrent functionc work together !! 
import unittest
from math_operations import add, subtract, multiply

class TestMathIntegration(unittest.TestCase):
    def test_add_and_multiply(self):
        result = add(2, 3)
        self.assertEqual(multiply(result, 4), 20)

if __name__ == '__main__':
    unittest.main()
