<script lang="ts">
	import { partners, stats } from '$lib/data';
	import { Star, Users, BookOpen } from 'lucide-svelte';
</script>

<!-- Trust Bar -->
<section class="border-y border-text/5 bg-white py-8">
	<div class="mx-auto max-w-6xl px-6">
		<div class="flex flex-col items-center gap-8 md:flex-row md:justify-between">
			<!-- Partner logos placeholder -->
			<div class="flex flex-wrap items-center justify-center gap-8 opacity-40">
				{#each partners as partner (partner.name)}
					<span class="font-heading text-sm font-bold tracking-wider text-text uppercase"
						>{partner.name}</span
					>
				{/each}
			</div>

			<!-- Stats -->
			<div class="flex gap-6 md:gap-8">
				<div class="flex items-center gap-2">
					<div class="flex h-8 w-8 items-center justify-center rounded-lg bg-cta/10">
						<Star size={14} class="text-cta" />
					</div>
					<div>
						<div class="font-heading text-lg font-bold text-text">{stats.rating}</div>
						<div class="text-xs text-text/50">Rating</div>
					</div>
				</div>
				<div class="flex items-center gap-2">
					<div class="flex h-8 w-8 items-center justify-center rounded-lg bg-primary/10">
						<Users size={14} class="text-primary" />
					</div>
					<div>
						<div class="font-heading text-lg font-bold text-text">15K+</div>
						<div class="text-xs text-text/50">Alumni</div>
					</div>
				</div>
				<div class="flex items-center gap-2">
					<div class="flex h-8 w-8 items-center justify-center rounded-lg bg-green-500/10">
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
