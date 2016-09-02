# Age of Empires 2: The Conquerors &mdash; Savegame File Format Specification

## Table of Contents

* [Document Format](#document-format)
* [Structure Definitions](#structure-definitions)
* [Ruby Parser](parser)
* [References](references)
* [Actions](#actions)

## Document Format
The specification document uses *GitHub Flavored Markdown (GFM)*. More information on this can be found [here](http://github.github.com/github-flavored-markdown/).

## Structure Definitions
The structure definitions kind of follow the *BinData Ruby Gem* declarations. They should be as readable as pseudo code though.
More information on *BinData* can be found [here](https://github.com/dmendel/bindata/wiki).

## Synchronization

## Messaging

## Gameplay Actions

|  Tag  | Description  |   |   | Validated |
|:-----:|--------------|---|---|:---:|
| 0x00  | ATTACK       |   |   |   |
| 0x0b  | RESIGN       |   |   |   |
| 0x01  | STOP         |   |   |   |
| 0x03  | MOVE         |   |   |   |
| 0x6a  | DELETE       |   |   | + |
| 0x6b  | ATTACKGROUND |   |   |   |
| 0x6c  | TRIBUTE      |   |   |   |
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
|   |   |   |   |   |
|   |   |   |   |   |
|   |   |   |   |   |
|   |   |   |   |   |
|   |   |   |   |   |

## FAQ

1. What actions are not saved but only calculated on replay simulation?
    - Reveal map is not saved but calculated on simulation replay.
    - Pause is not saved, that is why chat messages that were sent during the pause are displayed nearly at once when replayed.

2. What actions are only saved for certain players, i.e., the owner of the recorded game?
    - Viewpoints (for lock view) are only saved for the owner of the recorded game, together with the sychronization info.
    
- Object IDs are incremented. Every building, unit or resource gets an ID.
- Packing/unpacking of trebuchets is saved as ungarrison and garrison.