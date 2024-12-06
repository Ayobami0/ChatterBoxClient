<script lang="ts">
	const {
		src,
		alt,
		radius
	}: { src: string; alt?: string; radius?: number } = $props();
</script>

<figure class="flex-shrink-0" style:height={radius ? `${radius}px` : 'auto'} style:width={radius ? `${radius}px` : 'auto'}>
	<img {src} {alt} class="object-cover rounded-full" />
</figure>
