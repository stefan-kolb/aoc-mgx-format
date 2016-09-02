# Age of Empires 2: The Conquerors &mdash; Savegame File Format Specification

[![Donation](https://img.shields.io/badge/donate-paypal-orange.svg)](https://www.paypal.com/cgi-bin/webscr?item_name=AoC Savegames&cmd=_donations&lc=US&currency_code=EUR&business=stefan-kolb%40web.de)

## Table of Contents

* [Structure Definitions](#structure-definitions)
* [Ruby Parser](parser)
* [References](references)
* [Actions](#actions)
* [FAQ](#faq)

## Structure Definitions
The structure definitions kind of follow the *BinData Ruby Gem* declarations. They should be as readable as pseudo code though.
More information on *BinData* can be found [here](https://github.com/dmendel/bindata/wiki).

## Synchronization

## Messaging

## Gameplay Actions

|  Tag  | Description                                  |   |   | Validated |
|:-----:|----------------------------------------------|---|---|:---:|
| 0x00  | [ATTACK](spec/body/actions/00-attack.md)       |   |   |   |
| 0x0b  | [RESIGN](spec/body/actions/0b-resign.md)       |   |   | + |
| 0x01  | [STOP](spec/body/actions/01-stop.md)         |   |   |   |
| 0x03  | [MOVE](spec/body/actions/03-move.md)         |   |   |   |
| 0x6a  | [DELETE](spec/body/actions/6a-delete.md)       |   |   | + |
| 0x6b  | ATTACKGROUND |   |   |   |
| 0x6c  | [TRIBUTE](spec/body/actions/6c-tribute.md)      |   |   | + |
| 0x6e  | ?            |   |   |   |
| 0x6f  | UNLOAD       |   |   |   |
| 0x7a  | SELL         |   |   |   |
| 0x7b  | BUY          |   |   |   |
| 0x7f  | TOWNBELL     |   |   |   |
| 0x10  | WAYPOINT     |   |   |   |
| 0x12  | AGGRO        |   |   |   |
| 0x13  | GUARD        |   |   |   |
| 0x14  | FOLLOW       |   |   |   |
| 0x15  | PATROL       |   |   |   |
| 0x17  | FORMATION    |   |   |   |
| 0x18  | SAVE         |   |   |   |
| 0x64  | AI_TRAIN     |   |   |   |
| 0x65  | TECH         |   |   |   |
| 0x66  | BUILD        |   |   |   |
| 0x67  | ?            |   |   |   |
| 0x69  | WALL         |   |   |   |
| 0x72  | ?            |   |   |   |
| 0x73  | FLARE        |   |   |   |
| 0x75  | GARRISON     |   |   |   |
| 0x77  | TRAIN        |   |   |   |
| 0x78  | GATHER       |   |   |   |
| 0x80  | BACKTOWORK   |   |   |   |
| 0xFF  | GAMESTATS    | UP only  |   |   |
|   |   |   |   |   |

## FAQ

1. What actions are __not saved__ but only calculated on replay simulation?
    - Reveal map is not saved but calculated on simulation replay.
    - Pause is not saved, that is why chat messages that were sent during the pause are displayed nearly at once when replayed.

2. What actions are __only saved for certain players__, i.e., the owner of the recorded game?
    - Viewpoints (for lock view) are only saved for the owner of the recorded game, together with the sychronization info.
    
- Object IDs are incremented. Every building, unit or resource gets an ID.
- Packing/unpacking of trebuchets is saved as ungarrison and garrison.