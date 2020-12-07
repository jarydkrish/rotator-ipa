const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  purge: [
    './app/**/*.html',
    './app/**/*.html.erb',
    './app/**/*.js',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],
};
