<script lang="ts">
  import type { PageData } from "./$types";
  
  export let data: PageData;

</script>

<svelte:head>
  <title>@{data.username} Links</title>
  <meta name="description" content={data.bio} />
</svelte:head>


<main class="prose text-center mx-auto mt-8">

  <h1 class="mb-4 text-white" style="font-size: 4rem">
    @{data.username}
  </h1>

  <img
    src={data.photoURL ?? "/user.png"}
    alt="photoURL"
    width="256"
    class="mx-auto"
  />

  <p class="mt-4 text-white" style="font-size: 2rem">{data.bio ?? "no bio yet..."}</p>
  <ul class="list-none">
    {#each data.links as item}
      {@debug item}
    {/each}
  </ul>

</main>