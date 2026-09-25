class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260924-194344"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0021c1bee06a454410a7de59d572a50533fdf9bae5d8e05674deb11872a9d27d"
    sha256 cellar: :any_skip_relocation, sequoia:      "289000bdd9c376dc4cfd059ae292c1edf352ce28dfd0c6776669fca486ce0671"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dd8601b95b5b5be75cc072860cea1d47981d5efdcd4cdad0dbb936b1bc1128e1"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a77996335301fb304070e35cab0a06e3908485ec4b4d289ae3a8c3412a1404c5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2c01d07e0c5c7f761ab9cedbfe8f75f5769679f8317d82817fc927d0c63f37e7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a303125386ca689512de4a001cc8c140468e97e300d8d10ffae1587ec5c08933" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2294+71403f299.tar.xz"
  version "0.17.0-dev.2294+71403f299"
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
