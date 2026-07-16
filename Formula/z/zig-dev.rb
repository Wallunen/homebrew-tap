class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260714-170800"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b9b002180177c9d6f8f78ec938e419f2c555e0f22808e30daab88196ca921160"
    sha256 cellar: :any_skip_relocation, sequoia:      "6067f8c97f30d8be04f9519c212ffd493963bc5f84a5b23827c337b9156e8b06"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "069633c83345c1754ba85d5a40b28d804968194b54bed456a65fe9ef0626c581"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "95d75d6c37f31af0c7639d8a01b616a4e5cd91cb60e6e3550087bb76e21ecf43" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "77aa0c6c3719ebe0c2c94b5d07941d1b2895e8db3616dd31073e692c9b094c75" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "73059a78b96f21691a42d81ad964c1938a55a92aa65d47b79725d4a0a5e1ec11" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1413+addc3c3b8.tar.xz"
  version "0.17.0-dev.1413+addc3c3b8"
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
