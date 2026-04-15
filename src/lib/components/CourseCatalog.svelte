<script lang="ts">
	import { courses } from '$lib/data';
	import CourseCard from './CourseCard.svelte';
</script>

<section id="courses" class="bg-white py-20 md:py-28">
	<div class="max-w-6xl px-6 mx-auto">
		<!-- Section header -->
		<div class="mb-16 max-w-2xl mx-auto text-center">
			<div
				class="mb-4 bg-cta/10 px-4 py-1.5 text-xs font-semibold tracking-wide text-cta inline-block rounded-full uppercase"
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
		<div class="gap-8 sm:grid-cols-2 lg:grid-cols-2 grid">
			{#each courses as course (course.id)}
				<CourseCard {course} />
			{/each}
		</div>
	</div>
</section>
