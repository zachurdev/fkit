<script lang="ts">
  import { auth, user } from "$lib/firebase";

  import { GoogleAuthProvider, signInWithPopup, signOut } from "firebase/auth";

  async function signInWithGoogle() {
    const provider = new GoogleAuthProvider();
    const user = await signInWithPopup(auth, provider);
    console.log(user)
  }

</script>

<h2 class="text-primary">Login</h2>
{#if $user}
  <h2 class="">Welcome, {$user.displayName}</h2>
  <p class="">You are logged in</p>
  <button class="btn btn-danger" on:click={() => signOut(auth)}>Sign out</button>
{:else}
  <button class="btn btn-primary" on:click={signInWithGoogle}>Sign in with Google</button>
{/if}