from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

import unittest

import ifconfig

class IconfigTest(unittest.TestCase):

    def setUp(self):
        ifconfig.app.config['TESTING'] = True
        self.app = ifconfig.app.test_client()

    def test_should_return_content_of_X_forwarded_for_header(self):
        expected = b'192.168.42.42'
        res = self.app.get('/', headers = {'X-Forwarded-For': expected})
        assert res.status_code == 200
        assert res.data == expected
