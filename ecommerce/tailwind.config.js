/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './templates/**/*.html',  // All HTML files in the templates directory and subdirectories
    './templates/*.html',     // All HTML files in the templates directory 
    '/*/templates/**/*.html',  // All HTML files in the templates directory and subdirectories
    './*/**/*.html',
  ],
  theme: {
    extend: {},
  },
  plugins: ['@tailwindcss/forms'],
}

