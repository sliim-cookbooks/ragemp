ragemp Cookbook
================

Installs and configures RAGE:MP server.

[![Cookbook Version](https://img.shields.io/cookbook/v/ragemp.svg)](https://supermarket.chef.io/cookbooks/ragemp) [![Build Status](https://travis-ci.org/sliim-cookbooks/ragemp.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/ragemp) 

Requirements
------------

#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- `Debian 10`

Attributes
----------
#### ragemp::default

| Key                 | Type   | Description                                            |
| -----------         | ----   | -----------------------------------------              |
| `[ragemp][prefix]`  | String | Prefix dir to install RAGE:MP server (default: `/opt`) |
| `[ragemp][version]` | String | RAGE:MP version to install: (default: `037`)           |
| `[ragemp][config]`  | Hash   | RAGE:MP configuration                                  |

Usage
-----
#### ragemp
Include `ragemp` in your node's `run_list` to install RAGE:MP server:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ragemp]"
  ]
}
```

Testing
-------
See [TESTING.md](TESTING.md)

Contributing
------------
See [CONTRIBUTING.md](CONTRIBUTING.md)

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
