import { ConnectButton } from "@rainbow-me/rainbowkit";
import type { NextPage } from "next";
import Head from "next/head";
import styles from "../styles/Home.module.css";

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>RainbowKit App</title>
        <meta
          content="Generated by @rainbow-me/create-rainbowkit"
          name="description"
        />
        <link href="/favicon.ico" rel="icon" />
      </Head>

      <header
        style={{
          //centrar
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          padding: "10px",
        }}
      >
        {
          //<ConnectButton />
        }
        <img src="/Header.png" />
      </header>

      <main className={styles.main}>
        <div
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            flexDirection: "column",
            padding: "30px",
          }}
        >
          <img src="/text0.png" />
          <button
            style={{
              border: "none",
              cursor: "pointer",
              background: "#11b4d8",
              color: "white",
              //curvas en los bordes
              borderRadius: "10px",
              height: "50px",
              width: "200px",
              fontSize: "20px",
              padding: "10px",
              margin: "10px",
            }}
            onClick={() => (window.location.href = "/dapp")}
          >
            Start Earning
          </button>
          <br />
          <img src="/mid.png" />
        </div>
      </main>

      <footer className={styles.footer}>
        <a href="https://rainbow.me" rel="noopener noreferrer" target="_blank">
          Made with ❤️ by your frens at 🌈
        </a>
      </footer>
    </div>
  );
};

export default Home;
