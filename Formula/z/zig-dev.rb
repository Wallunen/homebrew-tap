class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260423-020756"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2273be885f8beae4c2eb80890226e15a7a0232d5a0877ee90ab461208590e9df"
    sha256 cellar: :any_skip_relocation, sequoia:      "a44c7cf60577aced12f4f1fbb1acb5591649408bbc8be6986b2f93cd68542a02"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8a0f3bb5f5693a7d63f6dd0c2e7ec2ebe3a35faeef6bd849462d4ffe121cc8d9"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "936a88ba86809f3adcb3a97689ff2de64e98118c57db51bab5ecf1fdc6c44c0d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7ad7b7b9120c6344ee5a7cce54f0f26c52991d47eb65323be935616b442fdfd8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c0e69671184873471a0a91359971100ed0aa0b391aa94905f8b8c90b2cc16696" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.76+ff612334f.tar.xz"
  version "0.17.0-dev.76+ff612334f"
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
