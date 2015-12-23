import unittest
import rolling

class RollingTest (unittest.TestCase):
    def testProcessBasicFrame(self):
        [score, tail] = rolling.processFrame(0, [1, 2, 3])
        self.assertEqual(score, 3)
        self.assertEqual(len(tail), 1)

if __name__ == "__main__":
    unittest.main()
