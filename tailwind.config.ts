import type { Config } from 'tailwindcss';
import typography from '@tailwindcss/typography';

export default {
	content: ['./src/**/*.{html,js,svelte,ts}'],
	theme: {
		extend: {
			fontFamily: {
				sans: ['Nunito Sans', 'sans-serif'],
				heading: ['Rubik', 'sans-serif']
			},
			colors: {
				primary: '#0EA5E9',
				secondary: '#38BDF8',
				cta: '#F97316',
				background: '#F0F9FF',
				text: '#0C4A6E'
			}
		}
	},
	plugins: [typography]
} satisfies Config;
