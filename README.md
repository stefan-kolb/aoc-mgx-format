# Age of Empires 2: The Conquerors &mdash; Savegame File Format Specification

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

|  Tag  | Description                                      |   |   | Validated |
|:-----:|--------------------------------------------------|---|---|:---:|
| 0x00  | [ATTACK](spec/body/actions/00-primary-action.md) |   |   | + |
| 0x01  | [STOP](spec/body/actions/01-stop.md)             |   |   | + |
| 0x02  | [AI_PRIMARY](spec/body/actions/02-ai-primary.md) |   |   | + |
| 0x03  | [MOVE](spec/body/actions/03-move.md)             |   |   | + |
| 0x0a  | [AI_MOVE](spec/body/actions/0a-ai-move.md)       |   |   |   |
| 0x0b  | [RESIGN](spec/body/actions/0b-resign.md)         |   |   | + |
| 0x10  | [WAYPOINT](spec/body/actions/10-waypoint.md)     |   |   | + |
| 0x12  | [STANCE](spec/body/actions/12-stance.md)         |   |   | + |
| 0x13  | [GUARD](spec/body/actions/13-guard.md)           |   |   | + |
| 0x14  | [FOLLOW](spec/body/actions/14-follow.md)         |   |   | + |
| 0x15  | [PATROL](spec/body/actions/15-patrol.md)         |   |   | + |
| 0x17  | [FORMATION](spec/body/actions/17-formation.md)   |   |   | + |
| 0x1b  | [SAVE & EXIT](spec/body/actions/1b-save.md)      |   |   |   |
| 0x1f  | [AI_COORD](spec/body/actions/1f-ai-coord.md)     |   |   | + |
| 0x64  | [AI_TRAIN](spec/body/actions/64-train.md)        |   |   | + |
| 0x65  | [TECH](spec/body/actions/65-research.md)         |   |   | + |
| 0x66  | [BUILD](spec/body/actions/66-build.md)           |   |   | + |
| 0x67  | [MULTIPURPOSE](spec/body/actions/67-diplo.md)    |   |   |   |
| 0x69  | [WALL](spec/body/actions/69-wall.md)             |   |   | + |
| 0x6a  | [DELETE](spec/body/actions/6a-delete.md)         |   |   | + |
| 0x6b  | [ATTACKGROUND](spec/body/actions/6b-attackground.md) |   |   | + |
| 0x6c  | [TRIBUTE](spec/body/actions/6c-tribute.md)       |   |   | + |
| 0x6e  | [REPAIR](spec/body/actions/6e-repair.md)         |   |   | + |
| 0x6f  | [UNGARRISON](spec/body/actions/6f-ungarrison.md) |   |   | + |
| 0x72  | [GATE](spec/body/actions/72-gate.md)             |   |   | + |
| 0x73  | [FLARE](spec/body/actions/73-flare.md)           |   |   | + |
| 0x75  | [GARRISON](spec/body/actions/75-garrison.md)     |   |   | + |
| 0x77  | [TRAIN](spec/body/actions/77-train.md)           |   |   | + |
| 0x78  | [RALLY](spec/body/actions/78-rallypoint.md)      |   |   | + |
| 0x7a  | [SELL](spec/body/actions/7a-sell.md)             |   |   | + |
| 0x7b  | [BUY](spec/body/actions/7b-buy.md)               |   |   | + |
| 0x7e  | [RELIC](spec/body/actions/7e-relic.md)           |   |   | + |
| 0x7f  | [TOWNBELL](spec/body/actions/7f-townbell.md)     |   |   | + |
| 0x80  | [BACKTOWORK](spec/body/actions/80-backtowork.md) |   |   | + |
| 0xFF  | GAMESTATS                                        | UP only  |   |   |

## FAQ

1. What actions are __not saved__ but only calculated on replay simulation?
    - Only actions that are actively taken by players are stored
    - Any other actions are either simulated during replay (map reveal) or determined by the random number generator (Gaia movement)
    - Pause is not saved, that is why chat messages that were sent during the pause are displayed nearly at once when replayed.

2. What actions are __only saved for certain players__, i.e., the owner of the recorded game?
    - Viewpoints (for lock view) are only saved for the owner of the recorded game, together with the sychronization info.

3. How does AoE2 create an .mgx file?
    - Singleplayer games are recorded by getting actions from the input buffer and writing them into the .mgx file.
    - During multiplayer games, actions are distributed to all players (even messages). The input buffer is transferred over the network to the other players.

4. Why are there so many zeros in the actions?
    - Most of the zeros are caused by memory alignment. Because networking and recording directly work on the input buffer, the data is aligned to 3the size of (menory) words (4 bytes). Example:

    ```c
    struct example {
      uint8_t player_id;
      uint32_t unit_id;
    };
    ```

    Here the first variable *player_id* will take up 1 out of 4 bytes of the first word. The next variable, *unit_id*, doesn't fit into the first word anymore, so it will use a second word instead. The remaining 3 bytes in the first word remain uninitialized and therefore have zero values in them.

5. Why are they doing this weird memory stuff? It sounds stupid
    - Because it is fast. Data can be put to use directly and does not have to be parsed.

6. What are the various IDs used for?
    - Players have an ID and a number. This is necessary because of an undocumented cooperative mode in AoE2, where players can have the same player number.
    - Unit IDs reference a **type** of unit/building or object in the game files.
    - Object IDs reference a specific object during a game. Every building, unit or resource gets an ID. For new units, the IDs are incremented.
