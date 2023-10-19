class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6199574668eed09be5603a8a8a68caef5ed9f9ced294f5d69564c4273cc3c860" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c9e392b80069473f38d062a994ba9c4af937eaff793e7aaa86e2bd292a7bb6f0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6935b0635ffcc122de3a3ac66602b186852c1b91af83d3cc3fd0774962b07b58" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1108+aeadcb391.tar.xz"
  version "0.12.0-dev.1108+aeadcb391"
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
