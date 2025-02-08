class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "72c4ec5f9ae22b9c55a6ae190dd97bebb4765ebacfac85f7ac51ead27e07acea" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "001df6b4ce50164fa3d20d4b9bfd8746ff4b66ff646ddaea1282d1f61c5ef863" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5be0f783c75b107fdf4ecb8d74275e8a3c363395c399aa10297e1f0aefe9340a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3066+1a1389c51.tar.xz"
  version "0.14.0-dev.3066+1a1389c51"
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
