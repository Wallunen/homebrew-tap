class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "26561c38b9da6a7fb0210ab842f25db6fb69f846f2be55d69c7f5271407b6ee2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dea68c093d58bf1f62a2e28f1ed03a7b4c76e276428d3f8e1e983309d270f40c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9c52cfe0ebf7acff69945bb8a3c3db57667c01ce7f674d0358149477ed21e3bb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3343+294f51814.tar.xz"
  version "0.12.0-dev.3343+294f51814"
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
