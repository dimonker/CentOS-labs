#!bin/bash
inf="\(II\)"
war="\(WW\)"
grep -E $war /var/log/Xorg.0.log | sed -E "s/$war/Warning: /" > full.log
grep -E $inf /var/log/Xorg.0.log | sed -E "s/$inf/Information: /" >> full.log
cat full.log
