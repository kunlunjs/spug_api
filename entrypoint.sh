#!/bin/sh
# Copyright: (c) OpenSpug Organization. https://github.com/openspug/spug
# Copyright: (c) <spug.dev@gmail.com>
# Released under the AGPL-3.0 License.

# set -e

# init spug
if [ ! -f /spug/spug_api/db.sqlite3 ]; then
    python manage.py updatedb
    python manage.py useradd -u admin -p spug.dev -s -n 管理员
fi

# supervisord -c /etc/supervisord.conf