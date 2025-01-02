class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b9eae66d050bedb286c63d3a8cd67d1aeebefc3b45ed290bb93d1734d699bb2f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "56f188bda29621c411ef436a0851296d406a1947fd20f2d2f5d72ab36092f6d1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e12db1beed1b6044cc5c668df099f5ebfbeb98a176e197a3ab1cca7b40762325" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2591+5333d2443.tar.xz"
  version "0.14.0-dev.2591+5333d2443"
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
