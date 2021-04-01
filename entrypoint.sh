#!/bin/sh
# Copyright: (c) OpenSpug Organization. https://github.com/openspug/spug
# Copyright: (c) <spug.dev@gmail.com>
# Released under the AGPL-3.0 License.

# set -e

# init spug
# python manage.py updatedb

supervisord -c /etc/supervisord.conf