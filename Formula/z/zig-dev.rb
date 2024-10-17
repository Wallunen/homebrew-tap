class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2e6cfe244ad1c80fe85ba054758b829652a310113056d7a73c832bf224a0ce27" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "19f2dc326dc6013ee60c82abaacf41b53fce0728d4a0aa59397c76db538e0cb0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "111804e51937f91a0133de0128b693831d1e8bcb9594abd14c27029a7d0b6cc5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1930+4a2a0f50c.tar.xz"
  version "0.14.0-dev.1930+4a2a0f50c"
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
