# components/

Reserved for larger, screen-specific composite components that
combine several base widgets but aren't generic enough to belong in
`widgets/` (e.g. a full "ArticleListItem" that composes `AppCard` +
`SectionHeader` + image handling specifically for the Artikel
screen).

For this foundation stage, everything reusable lives in `widgets/`
instead — this folder is empty on purpose. Start using it once a
screen needs a composite piece that's reused across more than one
place *within that feature* but doesn't belong in the app-wide
design system.
