class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b731da132fa4f3d129bbf113baf631c0c6a38006b551a888bddd4c97b7663ae6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d0e1f64cb4a9bfd52fbbada6f453df31ddd6f87965cacc35ce4fd9c30972b97d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8ce7bfb2ec173efe1d585c3d4495d7f8ffacefbef68a4c4827d39988d7c4d6ab" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1934+10c74631b.tar.xz"
  version "0.11.0-dev.1934+10c74631b"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
