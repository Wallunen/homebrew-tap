class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2c2a7d79c088dd744a6299edeef88b3cfebdfa697168ce7fcc966d9c72ad3115" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6c492ec09a044b5b507388181d3ab055c4724a19e09474fc3393131916bcff08" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4de4c8f4ead592628b6f4c8de0c6fd804e6c9b4a5c4f57cd567d648d201d235c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.929+a126afa1c.tar.xz"
  version "0.12.0-dev.929+a126afa1c"
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
