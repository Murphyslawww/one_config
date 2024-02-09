'use strict';
// See https://hyper.is#cfg for all currently supported options.

const palettes = {
    macchiato: {
        backgroundColor: '#24273a',
        foregroundColor: '#cad3f5',
        selectionColor: '#5b6078',
        cursorColor: '#f4dbd6',
        cursorAccentColor: '#181926',
        colors: {
            black: '#494d64',
            blue: '#8aadf4',
            red: '#ed8796',
            green: '#a6da95',
            yellow: '#eed49f',
            magenta: '#f5bde6',
            cyan: '#8bd5ca8bd5ca',
            white: '#b8c0e0',
            lightBlack: '#5b6078',
            lightWhite: '#a5adcb',
            lightBlue: '#8aadf4',
            lightRed: '#ed8796',
            lightGreen: '#a6da95',
            lightYellow: '#eed49f',
            lightMagenta: '#f5bde6',
            lightCyan: '#8bd5ca',
        },
    },
    mocha: {
        backgroundColor: '#1e1e2e',
        foregroundColor: '#cdd6f4',
        selectionColor: '#585b70',
        cursorColor: '#f5e0dc',
        cursorAccentColor: '#11111b',
        colors: {
            black: '#45475A',
            blue: '#89b4fa',
            red: '#f38ba8',
            green: '#a6e3a1',
            yellow: '#f9e2af',
            magenta: '#f5c2e7',
            cyan: '#94e2d5',
            white: '#bac2de',
            lightBlack: '#585b70',
            lightWhite: '#a6adc8',
            lightBlue: '#89b4fa',
            lightRed: '#f38ba8',
            lightGreen: '#a6e3a1',
            lightYellow: '#f9e2af',
            lightMagenta: '#f5c2e7',
            lightCyan: '#94e2d5',
        },
    },
};

export const decorateConfig = (config) => {
    const theme = palettes[config.catppuccinTheme.toLowerCase() || 'mocha'];
    return Object.assign({}, config, {
        workingDirectory: '/opt/REPOSITORIES/hyper',
        ...theme,
        termCSS: config.termCSS || '',
        css: `
      ${config.css}
      .hyper_main {
        border: none !important;
      }
      .header_header {
        color: ${theme.foregroundColor};
      }
      .header_windowHeaderWithBorder {
        border-color: ${theme.backgroundColor} !important;
      }
      .tabs_borderShim {
        border-color: transparent !important;
      }
      .tab_tab {
        border: 0;
      }
      .tab_tab.tab_active {
        background: ${theme.backgroundColor};
        color: ${theme.foregroundColor};
        transition: all 140ms ease;
      }
      .tab_tab:not(.tab_active) {
        background: ${theme.colors.black};
        color: ${theme.colors.lightWhite};
      }
      .tab_tab:not(.tab_active):hover {
        background: ${theme.colors.lightBlack};
        color: ${theme.foregroundColor};
        transition: background 140ms ease;
      }
      .tab_icon {
        width: 15px;
        height: 15px;
      }
      .tab_shape {
        width: 7px;
        height: 7px;
      }
      .splitpane_divider {
        background-color: ${theme.colors.lightBlack} !important;
      }
      `,
    });
};
