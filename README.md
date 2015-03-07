# qsnap—qsuscs’ BtrFS snapshot tool
`qsnap` is a simple snapshot tool for BtrFS.  It assumes that all subvolumes are
present in a certain directory (default `/mnt/root`, which is in fact my BtrFS
root (subvol 5)) and places snapshots next to them in a directory called
`${subvolume_name}.snapshots.`  Snapshots always have a name like
`2015-03-07T17:09+0100` (produced by `date -Im`), which is the time the snapshot
was created.  They are placed in a hierarchy of directories representing the
time of the snapshot, e.g. `home.snapshots/2015/03/07/2015-03-07T17:09+0100`.

## Usage
`qsnap ${subvolume_name}`.  To enable automatic snapshots (defaults to daily),
`systemctl enable qsnap@${subvolume_name}.timer`.

## Install
Put `qsnap` in `/usr/local/bin`, the systemd unit files in `/etc/systemd/system`
and `qsnap.conf` in `/etc`.

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
