import {
  RainbowKitProvider,
  getDefaultConfig,
  Chain,
} from '@rainbow-me/rainbowkit';
import {
  rootstockTestnet,
} from 'wagmi/chains';

const citreaTestnet = {
  id: 5115,
  name: 'Citrea Testnet',
  iconUrl: 'https://docs.citrea.xyz/~gitbook/image?url=https%3A%2F%2F4199298141-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FtFU3ZD7rSzMi2uz6wz9W%252Ficon%252FCXu0BBjlbVdU0NSgey8o%252FFrame%2520741%2520%281%29.png%3Falt%3Dmedia%26token%3Dcf27a311-adcd-43bf-ab7d-fe4c32ab49b3&width=32&dpr=1&quality=100&sign=1ec6029e&sv=1',
  iconBackground: '#fff',
  nativeCurrency: { name: 'cBTC', symbol: 'cBTC', decimals: 18 },
  rpcUrls: {
    default: { http: ['https://rpc.testnet.citrea.xyz'] },
  },
  blockExplorers: {
    default: { name: '', url: 'https://explorer.testnet.citrea.xyz' },
  },
} as const satisfies Chain;

export const config = getDefaultConfig({
  appName: 'RainbowKit App',
  projectId: 'YOUR_PROJECT_ID',
  chains: [
    rootstockTestnet,
    citreaTestnet,
  ],
  ssr: true,
});