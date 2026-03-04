import { Ref, ComputedRef } from 'vue';

export interface VirtualScrollState {
  containerRef: Ref<HTMLDivElement | null>;
  scrollTop: Ref<number>;
  isVirtualScrollEnabled: ComputedRef<boolean>;
  visibleData: ComputedRef<any[]>;
  visibleCount: ComputedRef<number>;
  startIndex: ComputedRef<number>;
  endIndex: ComputedRef<number>;
  totalHeight: ComputedRef<number>;
  offsetY: ComputedRef<number>;
  performanceStats: ComputedRef<{
    total: number;
    rendered: number;
    savedNodes: number;
    reductionPercent: string;
    enabled: boolean;
  }>;
  handleScroll: (event: Event) => void;
  scrollToIndex: (index: number) => void;
  scrollToTop: () => void;
  scrollToBottom: () => void;
}

export interface VirtualScrollOptions {
  dataSource?: any[] | Ref<any[]> | ComputedRef<any[]>;
  itemHeight?: number | ComputedRef<number>;
  buffer?: number | ComputedRef<number>;
  containerHeight?: number;
  enabled?: boolean | ComputedRef<boolean>;
  threshold?: number | ComputedRef<number>;
}

export function useVirtualScroll(options?: VirtualScrollOptions): VirtualScrollState;

export function getItemHeightBySize(size?: string): number;

export function getVirtualScrollStyle(virtualScrollState: VirtualScrollState): {
  containerStyle: Record<string, string>;
  wrapperStyle: Record<string, string>;
  contentStyle: Record<string, string>;
};
