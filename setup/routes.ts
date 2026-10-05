import { defineRoutesSetup } from '@slidev/types'

// В адресе Slidev показывает routeAlias слайда, но корень и /presenter
// захардкожены на /1 и /presenter/1. Ведём их на алиас титула, чтобы номер
// не появлялся в адресе даже при первом открытии.
export default defineRoutesSetup((routes) => {
  for (const route of routes) {
    if (route.path === '')
      route.redirect = { path: '/cover' }
    else if (route.path === '/presenter')
      route.redirect = { path: '/presenter/cover' }
  }
  return routes
})