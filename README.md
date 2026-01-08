The [Westminster Quarters](https://en.wikipedia.org/wiki/Westminster_Quarters) is the most common name for a melody used by a set of clock bells to chime on each quarter-hour. The number of chime sets matches the number of quarter hours that have passed.

#### Installation

To setup a virtual westminster clock that get's triggered with a cronjob, run:
```bash
sudo apt -y install git make sox alsa-utils
```
```bash
git clone https://github.com/koppi/westminster-clock
```
```bash
sudo make -C westminster-clock install
```
With ```crontab -e``` add to your crontab:
```
 0 4-22 * * * westminster-clock hour
15 4-22 * * * westminster-clock quarter
30 4-22 * * * westminster-clock half
45 4-22 * * * westminster-clock three-quarter
```
Tested on Raspbian 8.1 and Ubuntu 16.04 - Ubuntu 24.04.3 LTS.

#### Credits

* Westminster Quarters sound pack [gustav_becker_wall_clock_1920s](https://www.freesound.org/people/claudius9uk/packs/6224/) by claudius9uk.

#### License

* The files in this repository are licensed under the [Creative Commons 0 License](LICENSE).
