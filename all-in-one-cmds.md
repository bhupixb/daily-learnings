# Slackdump Commands

This document provides a list of commands for using [slackdump](https://github.com/rusq/slackdump/).

## General Commands

- `slackdump --help`: Displays help information.
- `slackdump wiz`: Starts the wizard.

## Login

- `slackdump login`: Logs in to Slack.

## Configuration

- `slackdump config check`: Checks the configuration.
- `slackdump help config`: Displays help for configuration commands.

## Export

Outputs injson format, with daily date files, each message/thread goes to respective date.json file.

- `slackdump export <channel_id>`: Exports the specified channel.
- `slackdump --type=standard export <channel_id>`: Exports the specified channel with standard type.
- `slackdump -files=false export <channel_id>`: Exports the specified channel without files.
- `slackdump export --format json`: Exports in JSON format.
- `slackdump help export`: Displays help for export commands.
- `slackdump help export | less`: Displays help for export commands and pipes it to less.

## Archive

Creates a `slackdump.sqlite` db. A root message can be identified with `thread_ts == ts || thread_ts is NULL` in message table.

```sql
sqlite3 slackdump.sqlite

.schema message

select * from MESSAGE limit 1;

-- get thread message for a given chunk
SELECT ID, TXT, CHANNEL_ID, TS, DATA
FROM MESSAGE 
WHERE thread_ts = ? AND is_parent = 0 AND chunk_id = ?
ORDER BY ID
```

- `slackdump archive`: Archives a channel.
- `slackdump archive --help`: Displays help for archive commands.
- `slackdump archive <channel_id>`: Archives the specified channel.
- `slackdump archive -files=false -o <output_directory> <channel_id>`: Archives the specified channel without files to the specified directory.
- `slackdump archive -files=false -time-from <timestamp> -o <output_directory> <channel_id>`: Archives the specified channel without files from a specific time to the specified directory.
- `slackdump archive -files=false -time-from <timestamp> -o <output_directory> <channel_id>/<message_id>`: Archives a specific message in a channel without files from a specific time to the specified directory.

## List

- `slackdump list channels -format json > <output_file>`: Lists channels in JSON format and redirects the output to a file.
- `slackdump list channels -format json <output_file>`: Lists channels in JSON format and saves the output to a file.
