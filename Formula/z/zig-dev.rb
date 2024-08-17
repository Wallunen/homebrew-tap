class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "12f172a13bae6d397d5f0eece0773e408c84a59d9ba792e57aa45f51bcf73887" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "252f026427fc74ec7df35f28aa2565da00816bb001dbc22a9738ed7093c14020" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6d1273ebd29b0704ed9cce74948b4a38e7c7eb21a6ca14bda60cfa51538fa2f0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1117+11176d22f.tar.xz"
  version "0.14.0-dev.1117+11176d22f"
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
