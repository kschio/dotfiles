function zj --description "Launch zellij with project layout"
    set -l layout "ai-coding"
    set -l session_name (basename $PWD)

    # Auto-detect project type by structure
    if test -d "apps/mobile" -a -f "pnpm-workspace.yaml"
        # Expo monorepo (pnpm + apps/mobile)
        set layout "expo-mono"
    else if test -d "apps" -a -f "turbo.json" -a -f "bun.lock"
        # Turborepo with bun
        set layout "turbo-bun"
    else if test -f "next.config.ts" -o -f "next.config.js" -o -f "next.config.mjs"
        # Next.js app
        set layout "next"
    end

    # Attach if exists, create with layout if not
    zellij -l $layout attach -c $session_name
end
