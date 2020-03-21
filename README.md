# pass env

An extension for the [password store](https://www.passwordstore.org/) that allows to display password in format suitable for importing as env variables.

[password store](https://www.passwordstore.org/) is a secure storage for sensivity data. A common password file would look like this:
```
Yw|ZSNH!}z"6{ym9pI
URL: *.amazon.com/*
Username: AmazonianChicken@example.com
```

A common use case is to copy the first line, the password, using `pass show -c <password file>`.

The meta data usually cannot be copied but needs to be displayed as it contains type and value.

## pass env

`pass env <password file>` displays the whole password file in way suitable for importing to environment ``pass env <password file>``. This allows to store cloud credentials i.e. AWS_KEY etc in `pass` and load them to enviromnent effectivly.

```
# Key for account Blah-blah-blah
AWS_ACCESS_KEY_ID=<access key>
AWS_SECRET_ACCESS_KEY=<secret access key>
```

invoking command `pass env <password file>` will show this file in form 

```
export AWS_ACCESS_KEY_ID=<access key>
export AWS_SECRET_ACCESS_KEY=<secret access key>
```

i.e. suitable to load to current shell enviromnet by `` operator

## Installation

- Enable password-store extensions by setting ``PASSWORD_STORE_ENABLE_EXTENSIONS=true``
- ``make install``
- alternatively add `env.bash` to your extension folder (by default at `~/.password-store/.extensions`)

## Completion

This extensions comes with the extension bash completion support added with password-store version 1.7.3

When installed, bash completion is already installed. Alternatively source `completion/pass-env.bash.completion`

fish and zsh completion are not available, feel free to contribute.

## Contribution

Contributions are always welcome.
