#!/usr/bin/env bash
#
# OP5 Script to change dashboard owner
#
# License: GPL
# Copyright (c) 2018 Ken Dobbins
# Author: Ken Dobbins <kdobbins@op5.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  if not, see <http://www.gnu.org/licenses/>.

old_username=$(mysql -u root -N -e 'select foreign_key from merlin.permission_quarks where foreign_key like "%$1%"')
new_username=$(mysql -u root -N -e 'select foreign_key from merlin.permission_quarks where foreign_key like "%$2%"')
mysql -u root -N -e 'UPDATE merlin.dashboards SET username = replace(username,"old_username","new_username")'
