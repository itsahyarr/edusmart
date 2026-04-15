<script lang="ts">
	import { partners, stats } from '$lib/data';
	import { Star, Users, BookOpen } from 'lucide-svelte';
</script>

<!-- Trust Bar -->
<section class="border-text/5 bg-white py-8 border-y">
	<div class="max-w-6xl px-6 mx-auto">
		<div class="gap-8 md:flex-row md:justify-between flex flex-col items-center">
			<!-- Partner logos placeholder -->
			<div class="gap-8 flex flex-wrap items-center justify-center opacity-40">
				{#each partners as partner (partner.name)}
					<span class="font-heading text-sm font-bold tracking-wider text-text uppercase"
						>{partner.name}</span
					>
				{/each}
			</div>

			<!-- Stats -->
			<div class="gap-6 md:gap-8 flex">
				<div class="gap-2 flex items-center">
					<div class="h-8 w-8 rounded-lg bg-cta/10 flex items-center justify-center">
						<Star size={14} class="text-cta" />
					</div>
					<div>
						<div class="font-heading text-lg font-bold text-text">{stats.rating}</div>
						<div class="text-xs text-text/50">Rating</div>
					</div>
				</div>
				<div class="gap-2 flex items-center">
					<div class="h-8 w-8 rounded-lg bg-primary/10 flex items-center justify-center">
						<Users size={14} class="text-primary" />
					</div>
					<div>
						<div class="font-heading text-lg font-bold text-text">15K+</div>
						<div class="text-xs text-text/50">Alumni</div>
					</div>
				</div>
				<div class="gap-2 flex items-center">
					<div class="h-8 w-8 rounded-lg bg-green-500/10 flex items-center justify-center">
						<BookOpen size={14} class="text-green-600" />
					</div>
					<div>
						<div class="font-heading text-lg font-bold text-text">{stats.courses}+</div>
						<div class="text-xs text-text/50">Kursus</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
