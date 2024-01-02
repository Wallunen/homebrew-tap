class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c64f7f0b14114234890b599a26f443d95554c3466ccd3a8bd84cd2892861b53a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0dc29877ef4ef62cfa38136ca5ad0230d3ff2bcaad92a36fc1bffa84892a16b6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "62cbaed358f7add7b696fa8428a8dc289c2495106fbfa9549aa42b3ba93bddcd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1871+e426ae43a.tar.xz"
  version "0.12.0-dev.1871+e426ae43a"
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
