use serde::Deserialize;
use serde::Serialize;
pub use typst::syntax::Span as TypstSpan;
pub use typst_library::prelude::Destination as TypstDestination;
pub use typst_library::prelude::EcoString as TypstEcoString;
pub use typst_library::prelude::FrameItem as TypstFrameItem;
pub use typst_library::prelude::GroupItem as TypstGroupItem;
pub use typst_library::prelude::Location as TypstLocation;
pub use typst_library::prelude::Position as TypstPosition;
pub use typst_library::prelude::Shape as TypstShape;
pub use typst_library::prelude::TextItem as TypstTextItem;

pub type SpanRef = ();
pub type FontRef = u32;
pub type Lang = String;
pub type EcoString = String;

/// Stably identifies an element in the document across multiple layout passes.
///
/// This struct is created by [`StabilityProvider::locate`].
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct Location {
    /// The hash of the element.
    pub hash: u128,
    /// An unique number among elements with the same hash. This is the reason
    /// we need a mutable `StabilityProvider` everywhere.
    pub disambiguator: usize,
    /// A synthetic location created from another one. This is used for example
    /// in bibliography management to create individual linkable locations for
    /// reference entries from the bibliography's location.
    pub variant: usize,
}