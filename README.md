# git-mediate.nvim
Git mediate for neovim

## Introduction

This is a very simple and handy neovim plugin for [Git Mediate](https://github.com/Peaker/git-mediate).

Git mediate a powerful tool that simplifies the process of resolving Git conflicts, making it a smooth and efficient experience

For more detailed information and usage instructions, please refer to the [official Git Mediate repository](https://github.com/Peaker/git-mediate).

## Installation
First you must install Git Mediate.
Please see instructions in the [official Git Mediate repository](https://github.com/Peaker/git-mediate).

Lazy Config:
```
{
    "Sharonex/git-mediate.nvim",
    dependencies={"mkotha/conlict3", "skywind3000/asyncrun.vim"},
    config = function()
        require("git-mediate").setup()
    end,
}
```

That's it! You're ready to streamline your Git conflict resolution process with git-mediate.nvim.

