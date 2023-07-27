class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "02962eeb563c9c9f9b86f9a2ec42010329066b68764fd464423bcf9340515117" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6bbd9c2475d5cd8defbe49f75a7d5a702f5ec867a1909b5457801815099e049d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3ad1dfe57ed4f3b47496735b6ff0471f116986d88152b36cfec4ab385c7ddc1c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4271+1aacfa718.tar.xz"
  version "0.11.0-dev.4271+1aacfa718"
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
