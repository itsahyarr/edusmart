<script lang="ts">
	import { courses } from '$lib/data';
	import CourseCard from './CourseCard.svelte';
</script>

<section id="courses" class="bg-white py-20 md:py-28">
	<div class="mx-auto max-w-6xl px-6">
		<!-- Section header -->
		<div class="mx-auto mb-16 max-w-2xl text-center">
			<div
				class="mb-4 inline-block rounded-full bg-cta/10 px-4 py-1.5 text-xs font-semibold tracking-wide text-cta uppercase"
			>
				Pilihan Kursus
			</div>
			<h2 class="font-heading text-3xl font-extrabold text-text md:text-4xl">
				Kursus Terbaik untuk Karirmu
			</h2>
			<p class="mt-4 text-text/60">
				Pilih kursus yang sesuai dengan minat dan goals karirmu. Semua kursus dilengkapi dengan
				sertifikat resmi.
			</p>
		</div>

		<!-- Course grid -->
		<div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-2">
			{#each courses as course (course.id)}
				<CourseCard {course} />
			{/each}
		</div>
	</div>
</section>
