<script lang="ts">
	import Header from '$lib/components/Header.svelte';
	import Hero from '$lib/components/Hero.svelte';
	import TrustBar from '$lib/components/TrustBar.svelte';
	import CoreValues from '$lib/components/CoreValues.svelte';
	import CourseCatalog from '$lib/components/CourseCatalog.svelte';
	import LimitedPromo from '$lib/components/LimitedPromo.svelte';
	import Testimonials from '$lib/components/Testimonials.svelte';
	import FAQ from '$lib/components/FAQ.svelte';
	import Footer from '$lib/components/Footer.svelte';
	import SocialProofPopup from '$lib/components/SocialProofPopup.svelte';
</script>

<svelte:head>
	<title>EduSmart — Platform Pendidikan Online #1 untuk Skill Digital</title>
	<meta
		name="description"
		content="Belajar skill digital langsung dari praktisi industri. Dapatkan sertifikat resmi dan tingkatkan karirmu. Promo launching diskon hingga 75%!"
	/>
</svelte:head>

<Header />
<main>
	<Hero />
	<TrustBar />
	<CoreValues />
	<CourseCatalog />
	<LimitedPromo />
	<Testimonials />
	<FAQ />
</main>
<Footer />
<SocialProofPopup />
