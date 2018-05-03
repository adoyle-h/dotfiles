'use strict';
module.exports = {
    config: {
        modifierKeys: {altIsMeta: true},

        windowSize: [1000, 600],

        // default font size in pixels for all tabs
        fontSize: 16,

        // font family with optional fallbacks
        fontFamily: '"ADejaVuSansMonoForPowerline Nerd Font", PingFangSC-Regular, DejaVuSansMono, Consolas',
        uiFontFamily: '"ADejaVuSansMonoForPowerline Nerd Font", PingFangSC-Regular, DejaVuSansMono, Consolas',

        // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
        cursorShape: 'BEAM',
        cursorBlink: true,

        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: 'rgba(255, 255, 255, 0.8)',
        foregroundColor: '#cdcdcd',
        backgroundColor: '#0b0b0c',

        // border color (window, tabs)
        borderColor: '#222',

        // custom css to embed in the main window
        css: '',

        // custom css to embed in the terminal window
        // termCSS: '',
        termCSS: '.wc-node.unicode-node{width: 1em}',

        // set to `true` if you're using a Linux set up
        // that doesn't shows native menus
        // default: `false` on Linux, `true` on Windows (ignored on macOS)
        showHamburgerMenu: '',

        // set to `false` if you want to hide the minimize, maximize and close buttons
        // additionally, set to `'left'` if you want them on the left, like in Ubuntu
        // default: `true` on windows and Linux (ignored on macOS)
        showWindowControls: '',

        // custom padding (css format, i.e.: `top right bottom left`)
        padding: '0px 8px 0px 8px',

        // the full list. if you're going to provide the full color palette,
        // including the 6 x 6 color cubes and the grayscale map, just provide
        // an array here instead of a color map object
        colors: {
            black: '#000000',
            red: '#e12000',
            green: '#00db1a',
            yellow: '#e1c731',
            blue: '#6980ff',
            magenta: '#bf6ee1',
            cyan: '#5dd9e1',
            white: '#e6e6e6',
            lightBlack: '#666666',
            lightRed: '#ff2600',
            lightGreen: '#00f91e',
            lightYellow: '#ffe037',
            lightBlue: '#afbaff',
            lightMagenta: '#e7afff',
            lightCyan: '#9bf9ff',
            lightWhite: '#ffffff',
            // colorCubes,
            // grayscale,
        },

        // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
        // if left empty, your system's login shell will be used by default
        shell: '/usr/local/bin/bash',

        // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
        // by default ['--login'] will be used
        shellArgs: ['--login'],

        // for environment variables
        env: {
            // PS1_SIGNATURE: '$',
        },

        // set to false for no bell
        bell: 'SOUND',

        // if true, selected text will automatically be copied to the clipboard
        copyOnSelect: false,

        // URL to custom bell
        // bellSoundURL: 'http://example.com/bell.mp3',

        // for advanced config flags please refer to https://hyper.is/#cfg

        // plugin configs:
        confirmQuit: true,
        hyperCat: {
            staggerHeight: 2, // The number of pixels the cat and rainbow should jump up and down.
            rainbowMaxAlpha: 0.6, // The max opacity of the rainbow.
            audioEnabled: false, // Whether audio should play while typing.
        },
        catCursor: {
            speed: 4000, // length of the sequence in milliseconds 
            // fontSize: 60, // font size of the cat in css pixels 
            // cats: ['😐', '😑'],
            cats: ['😺', '😸'],
            // cats: ['🌎', '🌍', '🌏'],
            // cats: ['🐱', '🙀', '😾', '😿', '😹', '😼', '😺', '😻', '😸', '😽'] // custom cat sequence. only cats are accepted, of course 
        },
    },

    // a list of plugins to fetch and install from npm
    // format: [@org/]project[#version]
    // examples:
    //   `hyperpower`
    //   `@company/project`
    //   `project#1.0.1`
    plugins: [
        // 'prop-types',
        // 'react',
        // 'hyperline',  // 依赖 prop-types, react
        'hypergravity',
        // 'hyper-cat-cursor',
        'hyper-match',
        'hyper-search',
        // 'hyper-cat',  // 警告：有猫
        'hypercwd',
        // 'hyper-confirm',
        // 'hyperpower',
    ],

    npmRegistry: 'https://registry.npm.taobao.org/',

    // in development, you can create a directory under
    // `~/.hyper_plugins/local/` and include it here
    // to load it and avoid it being `npm install`ed
    localPlugins: [],
};
