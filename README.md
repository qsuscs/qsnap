# qsnap—qsuscs’ BtrFS snapshot tool
… yes, there will be a README here some day.  Look at the source, it’s easy to
understand.

## Install
Put `mksnap.sh` in `/usr/local/bin`, the systemd unit files in
`/etc/systemd/system` and `qsnap.conf` in `/etc`.

## Configuration
Edit `/etc/qsnap.conf` and change `$ROOT` accordingly (defaults to `/mnt/root`).
To change the time a snapshot is automatically created, create a file ending in
`.conf` in `/etc/systemd/system/qsnap@.timer.d` (or
`qsnap@${subvolume_name}.timer.d` to limit to a certain subvolume) with a
content similar to this:
```INI
[Timer]
OnCalendar=
Oncalendar=weekly
```
See
[`systemd.timer(5)`](http://www.freedesktop.org/software/systemd/man/systemd.timer.html)
for details.
